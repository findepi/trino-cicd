-- Abandoned PRs
SELECT
  pulls.number
, pulls.title
, current_timestamp - max(pull_commits.committer_date) AS time_since_push
FROM
  pulls
LEFT JOIN
  pull_commits ON pulls.number = pull_commits.pull_number
WHERE pulls.owner = 'trinodb' AND pulls.repo = 'trino' AND pulls.state = 'open' AND NOT pulls.draft
GROUP BY 1, 2
ORDER BY time_since_push DESC
LIMIT 20
;
