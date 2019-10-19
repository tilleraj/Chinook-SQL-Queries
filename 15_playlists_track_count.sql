-- 15_playlists_track_count.sql
-- Provide a query that shows the total number of tracks in each playlist.
-- The Playlist name should be include on the resulant table.
select count(1) TracksInPlaylist, pt.PlaylistId as PLID, pl.Name as Playlist
from PlaylistTrack as pt
	join Playlist as pl
	on pl.PlaylistId = pt.PlaylistId
group by pt.PlaylistId, pl.Name