connection: "yash_test_missing"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: yash_test_missing_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
datagroup: my_scheduled_weekly_start_aug2026 {
  max_cache_age: "24 hour"
  sql_trigger:
    SELECT
      CASE
        WHEN CURRENT_TIMESTAMP() < TIMESTAMP '2026-08-02 08:00:00 UTC'
        THEN -1 -- Returns -1 before the start date

    ELSE
    CAST(
    FLOOR(
    (
    EXTRACT(EPOCH FROM CURRENT_TIMESTAMP() AT TIME ZONE 'UTC')
    - EXTRACT(EPOCH FROM TIMESTAMP '2026-08-02 08:00:00 UTC')
    ) / (7 * 24 * 3600)
    )
    AS INT)
    END AS sunday_0800_trigger_count ;;
  description: "Triggers weekly on Sundays at 08:00 UTC, starting from 2026-08-02."
}


persist_with: my_scheduled_weekly_start_aug2026

explore: commits {
    join: commits__parent {
      view_label: "Commits: Parent"
      sql: LEFT JOIN UNNEST(${commits.parent}) as commits__parent ;;
      relationship: one_to_many
    }
    join: commits__trailer {
      view_label: "Commits: Trailer"
      sql: LEFT JOIN UNNEST(${commits.trailer}) as commits__trailer ;;
      relationship: one_to_many
    }
    join: commits__repo_name {
      view_label: "Commits: Repo Name"
      sql: LEFT JOIN UNNEST(${commits.repo_name}) as commits__repo_name ;;
      relationship: one_to_many
    }
    join: commits__difference {
      view_label: "Commits: Difference"
      sql: LEFT JOIN UNNEST(${commits.difference}) as commits__difference ;;
      relationship: one_to_many
    }
}

explore: files {}

explore: languages {
    join: languages__language {
      view_label: "Languages: Language"
      sql: LEFT JOIN UNNEST(${languages.language}) as languages__language ;;
      relationship: one_to_many
    }
}

explore: contents {}

explore: sample_files {}

explore: sample_commits {
    join: sample_commits__parent {
      view_label: "Sample Commits: Parent"
      sql: LEFT JOIN UNNEST(${sample_commits.parent}) as sample_commits__parent ;;
      relationship: one_to_many
    }
    join: sample_commits__trailer {
      view_label: "Sample Commits: Trailer"
      sql: LEFT JOIN UNNEST(${sample_commits.trailer}) as sample_commits__trailer ;;
      relationship: one_to_many
    }
    join: sample_commits__difference {
      view_label: "Sample Commits: Difference"
      sql: LEFT JOIN UNNEST(${sample_commits.difference}) as sample_commits__difference ;;
      relationship: one_to_many
    }
}

explore: sample_contents {}

explore: tab {
    join: tab__addresses {
      view_label: "Tab: Addresses"
      sql: LEFT JOIN UNNEST(${tab.addresses}) as tab__addresses ;;
      relationship: one_to_many
    }
}

explore: sample_repos {}

explore: table_missing {
    join: table_missing__addresses {
      view_label: "Table Missing: Addresses"
      sql: LEFT JOIN UNNEST(${table_missing.addresses}) as table_missing__addresses ;;
      relationship: one_to_many
    }
}

explore: licenses {}
