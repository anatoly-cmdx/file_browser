class @FileBrowserEntry extends React.Component
  @propTypes =
    entry: React.PropTypes.object,
    href_root: React.PropTypes.string

  render: ->
    entry = this.props.entry
    href_root = this.props.href_root
    icon_folder = 'fa fa-fw fa-folder-o'
    icon_file = 'fa fa-fw fa-file-text-o'

    icon = if entry['dir'] then icon_folder else icon_file
    size = if entry['dir'] then '' else entry['size']
    href = "#{href_root}/#{entry['path']}"

    entry_name = if entry['dir']
    then `<a href={href}>{entry['name']}</a>`
    else `<span>{entry['name']}</span>`

    `<tr className="directory_entry">
      <td><i className={icon}></i>{entry_name}</td>
      <td className="text-right">{size}</td>
    </tr>`
