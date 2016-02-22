class @FileBrowserDirectory extends React.Component
  @propTypes =
    entries: React.PropTypes.array,
    href_root: React.PropTypes.string

  render: ->
    directory_entries = []
    for entry, i in this.props.entries
      directory_entries.push `<FileBrowserEntry entry={entry} 
                                                key={'directory_entry' + i}
                                                href_root={this.props.href_root} />`

    `<table className="table">
      <thead>
        <tr>
          <th className="col-sm-10">Name</th>
          <th className="col-sm-2">Size</th>
        </tr>
      </thead>
      <tbody>{directory_entries}</tbody>
    </table>`
