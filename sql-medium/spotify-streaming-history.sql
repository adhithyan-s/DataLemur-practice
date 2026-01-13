SELECT
  user_id,
  song_id,
  SUM(song_plays) as song_plays
FROM(
  SELECT
    user_id,
    song_id,
    song_plays
  FROM songs_history
  
  UNION ALL
  
  SELECT
    user_id,
    song_id,
    COUNT(song_id) as song_plays
  FROM songs_weekly
  WHERE listen_time <= '08/04/2022 23:59:59'
  GROUP BY user_id, song_id
) as history
GROUP BY user_id, song_id
ORDER BY song_plays DESC