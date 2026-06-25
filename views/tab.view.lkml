view: tab {
  sql_table_name: `test_million.tab` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: addresses {
    hidden: yes
    sql: ${TABLE}.addresses ;;
  }
  dimension_group: dob {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dob ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, last_name, first_name]
  }
}

view: tab__addresses {

  dimension: address {
    type: string
    sql: address ;;
  }
  dimension: city {
    type: string
    sql: city ;;
  }
  dimension: number_of_years {
    type: string
    sql: numberOfYears ;;
  }
  dimension: state {
    type: string
    sql: state ;;
  }
  dimension: status {
    type: string
    sql: status ;;
  }
  dimension: tab__addresses {
    type: string
    hidden: yes
    sql: tab__addresses ;;
  }
  dimension: zip {
    type: zipcode
    sql: zip ;;
  }
}
