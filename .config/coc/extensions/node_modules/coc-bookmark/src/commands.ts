import { workspace, Neovim, Uri } from 'coc.nvim'
import DB from './util/db'
import { BookmarkItem, DocInfo } from './types'

export default class Bookmark {
  private signCache: Set<number> = new Set()
  constructor(private nvim: Neovim, private db: DB) { }

  private async getDocInfo(): Promise<DocInfo> {
    const doc = await workspace.document
    const lnum = await this.nvim.call('line', ['.'])
    const line = await this.nvim.line
    const filetype = doc.filetype
    const filepath = Uri.parse(doc.uri).fsPath
    return { lnum, line, filetype, filepath }
  }

  public async create(annotation: string): Promise<void> {
    const { lnum, line, filetype, filepath } = await this.getDocInfo()

    const bookmark: BookmarkItem = {
      lnum,
      line,
      filetype,
      annotation
    }

    await this.db.add(bookmark, filepath)
  }

  public async annotate(): Promise<void> {
    const annotation = await workspace.requestInput('Annotation')
    if (annotation && annotation.trim()) {
      await this.create(annotation.trim())
    }
  }

  public async delete(): Promise<void> {
    const { lnum, filepath } = await this.getDocInfo()
    await this.db.delete(filepath, lnum)
  }

  public async toggle(): Promise<void> {
    const data = await this.db.load()
    const { lnum, filepath } = await this.getDocInfo()
    const bookmarks = data.get(filepath)
    if (bookmarks) {
      if (bookmarks.filter(b => b.lnum === lnum).length !== 0) {
        await this.delete()
        return
      }
    }
    await this.create('')
  }

  public async find(direction: 'next' | 'prev'): Promise<void> {
    const data = await this.db.load()
    const { filepath, lnum } = await this.getDocInfo()
    const bookmark = data.get(filepath)
    if (bookmark) {
      if (direction === 'next') {
        for (const blnum of bookmark.map(b => b.lnum).sort()) {
          if (blnum > lnum) {
            await workspace.moveTo({
              line: Math.max(blnum - 1, 0),
              character: 0
            })
            return
          }
        }
      } else {
        for (const blnum of bookmark.map(b => b.lnum).sort().reverse()) {
          if (blnum < lnum) {
            await workspace.moveTo({
              line: Math.max(blnum - 1, 0),
              character: 0
            })
            return
          }
        }
      }
    }
  }

  public async updateSign(): Promise<void> {
    const data = await this.db.load()
    const { filepath } = await this.getDocInfo()
    const bookmarks = data.get(filepath)

    if (bookmarks) {
      const signLnums = bookmarks.map(b => b.lnum)
      for (const lnum of this.signCache) {
        if (signLnums.indexOf(lnum) < 0) {
          await this.nvim.command(`silent! sign unplace ${lnum}`)
          this.signCache.clear()
        }
      }

      for (const bookmark of bookmarks) {
        const { lnum, line } = bookmark
        const currLine = await this.nvim.call('getline', [lnum])
        if (currLine.trim() !== line.trim()) {
          await this.db.delete(filepath, lnum)
          continue
        }
        const cmd = `exe ":sign place ${lnum} line=${lnum} name=BookMark file=" . expand("%:p")`
        this.signCache.add(lnum)
        this.nvim.command(cmd, true)
      }
    } else {
      if (this.signCache.size != 0) {
        for (const lnum of this.signCache) {
          await this.nvim.command(`silent! sign unplace ${lnum}`)
          this.signCache.clear()
        }
      }
    }
  }
}
