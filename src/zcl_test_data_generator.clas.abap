CLASS zcl_test_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_data_generator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_currency TYPE TABLE OF zsales_currency,
          lt_partner  TYPE TABLE OF zsales_partner,
          lt_status   TYPE TABLE OF zsales_status.

    lt_currency = VALUE #(  (  cuky = 'INR'  )
                            (  cuky = 'USD'  ) ).

    lt_partner = VALUE #( ( partner = '1000100001' name = 'PARTNER 1' type = 'C' )
                          ( partner     = '1000100002' name = 'PARTNER 2' type = 'V' )  ).

    lt_status = VALUE #( ( status = 'O' text = 'Open' )
                         ( status = 'C' text = 'Completed' )
                         ( status = 'R' text = 'Rejected' )  ).

    DELETE FROM zsales_currency.
    DELETE FROM zsales_partner.
    DELETE FROM zsales_status.

    INSERT zsales_currency FROM TABLE @lt_currency.
    INSERT zsales_partner FROM TABLE @lt_partner.
    INSERT zsales_status FROM TABLE @lt_status.

  ENDMETHOD.

ENDCLASS.
