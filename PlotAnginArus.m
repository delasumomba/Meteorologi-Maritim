angin = 'dataanginhourlyJulDes2025.nc';   
arus = 'dataarus2025daily.nc';
ncdisp(angin)
ncdisp(arus)
lon_angin = ncread(angin,'longitude');
lat_angin = ncread(angin,'latitude');
lon_arus = ncread(arus,'longitude');
lat_arus = ncread(arus,'latitude');
u_angin = ncread(angin,'u');
v_angin = ncread(angin,'v');
u_arus = ncread(arus,'uo');
v_arus = ncread(arus,'vo');
u_arus2 = squeeze(u_arus(:,:,1,299));
v_arus2 = squeeze(v_arus(:,:,1,299));
u_angin2 = squeeze(u_angin(:,:,1,2809:2832));
v_angin2 = squeeze(v_angin(:,:,1,2809:2832));
u_angin_rata = mean(u_angin2,3);
v_angin_rata = mean(v_angin2,3);
kecepatan_arus = sqrt(u_arus2.^2 + v_arus2.^2);
kecepatan_angin = sqrt(u_angin_rata.^2 + v_angin_rata.^2);
[lon_angin2, lat_angin2] = meshgrid(lon_angin, lat_angin);
[lon_arus2, lat_arus2] = meshgrid(lon_arus, lat_arus);
figure(1)
subplot(1,2,1)
m_proj('miller','lon',[115 130],'lat',[-8 21]);
m_pcolor(lon_arus2,lat_arus2,kecepatan_arus');
shading flat
cmocean speed
hold on
m_gshhs_h('patch',[.8 .8 .8]);
m_gshhs_h('patch',[.7 .7 .7]);
m_grid
m_quiver(lon_arus2(1:7:end,1:7:end), lat_arus2(1:7:end,1:7:end), u_arus2(1:7:end,1:7:end)', v_arus2(1:7:end,1:7:end)', 1.5, 'k');
title('Peta Arus Permukaan Sulawesi 26 Oktober 2025')
xlabel('Longitude')
ylabel('Latitude')
cb = colorbar;
cb.Label.String = 'Kecepatan Arus (m/s)';
subplot(1,2,2)
m_proj('miller','lon',[115 130],'lat',[-8 20]);
m_pcolor(lon_angin2,lat_angin2,kecepatan_angin');
shading flat
cmocean speed
hold on
m_gshhs_h('patch',[.7 .7 .7]);
m_grid
m_quiver(lon_angin2(1:5:end,1:5:end), lat_angin2(1:5:end,1:5:end), u_angin_rata(1:5:end,1:5:end)', v_angin_rata(1:5:end,1:5:end)', 'k');
title('Peta Kecepatan Angin Sulawesi 26 Oktober 2025')
xlabel('Longitude')
ylabel('Latitude')
cb = colorbar;
cb.Label.String = 'Kecepatan Angin (m/s)';
set(gcf,'position',[50 50 3840 2160]);
print(gcf,'plotpetaarusangin26Oktober2025.png','-dpng','-r600');