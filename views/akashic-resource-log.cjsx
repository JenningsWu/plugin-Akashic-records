{React, ReactBootstrap, __} = window
{Tabs, Tab} = ReactBootstrap

#import i18n from '../node_modules/i18n'
# {__} = i18n

import ResourceChart from './containers/resource-chart'

CheckboxPanel = (require './containers/checkbox-panel').resourceCP
import TableArea from './containers/resource-table'

AkashicResourceTable = React.createClass
  render: ->
    <div>
      <CheckboxPanel contentType='resource'/>
      <TableArea contentType='resource'/>
    </div>

AkashicResourceLog = React.createClass
  getInitialState: ->
    mapShowFlag: true
    selectedKey: 0
    data: []

  handleSelectTab: (selectedKey)->
    if selectedKey is 0
      @setState
        mapShowFlag: true
        selectedKey: selectedKey
    else
      @setState
        mapShowFlag: false
        selectedKey: selectedKey

  render: ->
    <div>
    <Tabs activeKey={@state.selectedKey} animation={false} onSelect={@handleSelectTab}>
      <Tab eventKey={0} title={__ "Chart"} ><ResourceChart mapShowFlag={@state.mapShowFlag and @props.mapShowFlag}/></Tab>
      <Tab eventKey={1} title={__ "Table"} ><AkashicResourceTable /></Tab>
    </Tabs>
    </div>

module.exports = AkashicResourceLog
