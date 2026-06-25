view: languages {
  sql_table_name: `test_million.languages` ;;

  dimension: language {
    hidden: yes
    sql: ${TABLE}.language ;;
  }
  dimension: repo_name {
    type: string
    sql: ${TABLE}.repo_name ;;
  }
  measure: count {
    type: count
    drill_fields: [repo_name]
  }
}

view: languages__language {

  dimension: bytes {
    type: number
    sql: bytes ;;
  }
  dimension: languages__language {
    type: string
    hidden: yes
    sql: languages__language ;;
  }
  dimension: name {
    type: string
    sql: name ;;
  }
}
