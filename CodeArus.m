dataarus = 'dataarus2025daily.nc';
long = double(ncread(dataarus,'longitude'));
lat  = double(ncread(dataarus,'latitude'));
uo = ncread(dataarus,'uo');
vo = ncread(dataarus,'vo');
uo26 = uo(:,:,1,299);
vo26 = vo(:,:,1,299);
kca = sqrt(uo26.^2 + vo26.^2);
[long2,lat2] = meshgrid(long,lat);

m_proj('miller', ...
    'long',[min(long) max(long)], ...
    'lat',[min(lat) max(lat)]);

hold on;

m_pcolor(long2,lat2,kca');
shading interp
hold on
m_gshhs_h('patch',[0.8 0.8 0.8]);
m_grid;
cmocean('matter');
[long3,lat3] = m_ll2xy(long2,lat2);
longgar = 13;

[long4,lat4] = meshgrid( ...
    long(1:longgar:end), ...
    lat(1:longgar:end));

[long5,lat5] = m_ll2xy(long4,lat4);

h = streamline( ...
    long3,lat3, ...
    uo26',vo26', ...
    long5,lat5);

set(h,'Color','m','LineWidth',0.6);
cb = colorbar;

title('Peta Streamline Arus 26 Oktober 2025', ...
    'FontName','Times New Roman', ...
    'FontWeight','bold', ...
    'FontSize',12);

xlabel('Longitude', ...
    'FontName','Times New Roman', ...
    'FontWeight','bold', ...
    'FontSize',10);

ylabel('Latitude', ...
    'FontName','Times New Roman', ...
    'FontWeight','bold', ...
    'FontSize',10);

hold off;
set(gcf, 'Color', 'w');
set(gca, 'Color', 'w');
set(gcf, 'Position', [50 50 3840 2160]);