view: contents {
  sql_table_name: `test_million.contents` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: binary {
    type: yesno
    sql: ${TABLE}.binary ;;
  }
  dimension: content {
    type: string
    sql: ${TABLE}.content ;;
  }
  dimension: copies {
    type: number
    sql: ${TABLE}.copies ;;
  }
  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
