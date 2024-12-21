@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZVH_PARTNER
  as select from zsales_partner as Partner
{
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Name']
  key Partner.partner as Partner,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text: true
      Partner.name    as Name,

      Partner.type    as Type
}
