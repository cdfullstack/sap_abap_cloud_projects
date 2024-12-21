@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Sales Order Header'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_SALESORDER_HEADER
  provider contract transactional_query
  as projection on ZI_SALESORDER_HEADER
{
  key Soid          as Guid,
      @Search.defaultSearchElement: true
      Sorder        as SOrderNo,
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZVH_PARTNER', element: 'Partner' } }]
      @ObjectModel.text.element: [ 'Name' ]
      Partner       as Customer,
      _Partner.name as Name,
      @Consumption.valueHelpDefinition: [{ entity : { name: 'ZVH_STATUS', element: 'Status' } }]
      @ObjectModel.text.element: [ 'Text' ]
      Status        as Status,
      _Status.text  as Text,
      @Semantics.amount.currencyCode: 'Currency'
      Price,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZVH_CURRENCY', element: 'PriceUnit' } }]
      Cuky          as Currency,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt
}
