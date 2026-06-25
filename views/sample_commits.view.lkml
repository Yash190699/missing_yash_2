view: sample_commits {
  sql_table_name: `test_million.sample_commits` ;;

  dimension_group: author_ {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.author.date ;;
  }
  dimension: author__email {
    type: string
    sql: ${TABLE}.author.email ;;
    group_label: "Author"
    group_item_label: "Email"
  }
  dimension: author__name {
    type: string
    sql: ${TABLE}.author.name ;;
    group_label: "Author"
    group_item_label: "Name"
  }
  dimension: author__time_sec {
    type: number
    sql: ${TABLE}.author.time_sec ;;
    group_label: "Author"
    group_item_label: "Time Sec"
  }
  dimension: author__tz_offset {
    type: number
    sql: ${TABLE}.author.tz_offset ;;
    group_label: "Author"
    group_item_label: "Tz Offset"
  }
  dimension: commit {
    type: string
    sql: ${TABLE}.commit ;;
  }
  dimension_group: committer_ {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.committer.date ;;
  }
  dimension: committer__email {
    type: string
    sql: ${TABLE}.committer.email ;;
    group_label: "Committer"
    group_item_label: "Email"
  }
  dimension: committer__name {
    type: string
    sql: ${TABLE}.committer.name ;;
    group_label: "Committer"
    group_item_label: "Name"
  }
  dimension: committer__time_sec {
    type: number
    sql: ${TABLE}.committer.time_sec ;;
    group_label: "Committer"
    group_item_label: "Time Sec"
  }
  dimension: committer__tz_offset {
    type: number
    sql: ${TABLE}.committer.tz_offset ;;
    group_label: "Committer"
    group_item_label: "Tz Offset"
  }
  dimension: difference {
    hidden: yes
    sql: ${TABLE}.difference ;;
  }
  dimension: difference_truncated {
    type: yesno
    sql: ${TABLE}.difference_truncated ;;
  }
  dimension: encoding {
    type: string
    sql: ${TABLE}.encoding ;;
  }
  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }
  dimension: parent {
    hidden: yes
    sql: ${TABLE}.parent ;;
  }
  dimension: repo_name {
    type: string
    sql: ${TABLE}.repo_name ;;
  }
  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }
  dimension: trailer {
    hidden: yes
    sql: ${TABLE}.trailer ;;
  }
  dimension: tree {
    type: string
    sql: ${TABLE}.tree ;;
  }
  measure: count {
    type: count
    drill_fields: [repo_name, author__name, committer__name]
  }
}

view: sample_commits__parent {

  dimension: sample_commits__parent {
    type: string
    sql: sample_commits__parent ;;
  }
}

view: sample_commits__trailer {

  dimension: email {
    type: string
    sql: email ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: sample_commits__trailer {
    type: string
    hidden: yes
    sql: sample_commits__trailer ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}

view: sample_commits__difference {

  dimension: new_mode {
    type: number
    sql: new_mode ;;
  }
  dimension: new_path {
    type: string
    sql: new_path ;;
  }
  dimension: new_repo {
    type: string
    sql: new_repo ;;
  }
  dimension: new_sha1 {
    type: string
    sql: new_sha1 ;;
  }
  dimension: old_mode {
    type: number
    sql: old_mode ;;
  }
  dimension: old_path {
    type: string
    sql: old_path ;;
  }
  dimension: old_repo {
    type: string
    sql: old_repo ;;
  }
  dimension: old_sha1 {
    type: string
    sql: old_sha1 ;;
  }
  dimension: sample_commits__difference {
    type: string
    hidden: yes
    sql: sample_commits__difference ;;
  }
}
