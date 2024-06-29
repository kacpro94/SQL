use record_company;

-- showing only the names of all bands

select name as 'Band Name' from bands;

-- Selecting the oldest album

select a.id,a.name,release_year,band_id from albums a join bands b on a.band_id=b.id
where release_year is not null
order by release_year asc
limit 1;

-- Getting all the bands that have albums

select distinct b.name as 'Band name' from bands b inner join albums a on b.id=a.band_id;

-- Getting all bands that have no album

select distinct b.name as 'Band name' from bands b left join albums a on b.id=a.band_id
group by b.name
having COUNT(a.band_id)=0;

-- Getting the longest album

select a.name,a.release_year,sum(s.length) as 'Duration' from albums a inner join songs s on a.id=s.album_id
group by a.name,a.release_year
order by Duration desc
limit 1;

-- update the release year of the album with no release year
select id from albums
where release_year is null;

update albums
set release_year=1986
where id=4;

-- geting the average length of all songs

select avg(length) as 'Average Song Duration' from songs;

-- selecting the longest song off each album

select a.name,a.release_year,max(s.length) as 'Duration' from albums a inner join songs s on a.id=s.album_id
group by s.album_id;
 
 -- getting the number of songs for each band
 
 select b.name as 'Band',count(s.name) as 'Number of songs' from bands b
 inner join albums a 
 on b.id=a.band_id 
 inner join songs s 
 on a.id=s.album_id
 group by a.band_id;
