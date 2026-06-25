view: sample_contents {
  sql_table_name: `test_million.sample_contents` ;;
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
  dimension: sample_mode {
    type: number
    sql: ${TABLE}.sample_mode ;;
  }
  dimension: sample_path {
    type: string
    sql: ${TABLE}.sample_path ;;
  }
  dimension: sample_ref {
    type: string
    sql: ${TABLE}.sample_ref ;;
  }
  dimension: sample_repo_name {
    type: string
    sql: ${TABLE}.sample_repo_name ;;
  }
  dimension: sample_symlink_target {
    type: string
    sql: ${TABLE}.sample_symlink_target ;;
  }
  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }
  measure: count {
    type: count
    drill_fields: [id, sample_repo_name]
  }
}
