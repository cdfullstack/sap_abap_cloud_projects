CLASS lhc_salesheader DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS GenerateOrderNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR SalesHeader~GenerateOrderNumber.

ENDCLASS.

CLASS lhc_salesheader IMPLEMENTATION.

  METHOD GenerateOrderNumber.
    READ ENTITIES OF zi_salesorder_header IN LOCAL MODE
    ENTITY SalesHeader
    FIELDS ( sorder )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_sorder).

    DELETE lt_sorder WHERE sorder IS NOT INITIAL.

    IF lt_sorder IS NOT INITIAL.
      SELECT SINGLE FROM zsales_orderhead
      FIELDS MAX( sorder )
      INTO @DATA(lv_sorder_max).

      MODIFY ENTITIES OF zi_salesorder_header IN LOCAL MODE ENTITY SalesHeader
       UPDATE FIELDS (  sorder )
       WITH VALUE #( FOR ls_sorder IN lt_sorder INDEX INTO i ( %key = ls_sorder-%key
                                                               sorder = lv_sorder_max + i )  )
       REPORTED DATA(lt_reported).
    ENDIF.
  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
