class @FileBrowserBreadcrumbs extends React.Component
  @propTypes =
    path: React.PropTypes.string,
    href_root: React.PropTypes.string

  render: ->
    href_root = this.props.href_root
    icon_parent = 'fa fa-fw fa-folder-open'
    icon_current = 'fa fa-fw fa-folder-open-o'
    path_entries = if this.props.path? then this.props.path.split('/') else []
    parents = path_entries[0..-2]
    current = path_entries[-1..][0]
    directory_root_name = 'ROOT'

    directories = []
    root_directory = if this.props.path
    then `<li key='0'><i className={icon_parent}></i><a href={href_root}>{directory_root_name}</a></li>`
    else `<li key='0'><i className={icon_current}></i>{directory_root_name}</li>`
    directories.push root_directory

    for parent, i in parents
      href = "#{href_root}/#{parents[0..i].join('/')}"
      directories.push `<li key={i + 1}>
        <i className={icon_parent}></i><a 
        href={href}>{parent}</a>
      </li>`

    if current
      directories.push `<li key={path_entries.length + 1} className="active"><i className={icon_current}></i>{current}</li>`

    `<ul className="breadcrumb">{directories}</ul>`
