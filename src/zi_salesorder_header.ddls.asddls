@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Sales Order Header View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_SALESORDER_HEADER
  as select from zsales_orderhead as SalesHeader
  association [0..1] to zsales_partner  as _Partner  on $projection.Partner = _Partner.partner
  association [0..1] to zsales_status   as _Status   on $projection.Status = _Status.status
  association [0..1] to zsales_currency as _Currency on $projection.Cuky = _Currency.cuky
{
  key soid            as Soid,
      sorder          as Sorder,
      partner         as Partner,
      status          as Status,
      @Semantics.amount.currencyCode: 'cuky'
      price           as Price,
      cuky            as Cuky,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _Partner,
      _Status,
      _Currency
}
