function ImageSortie = rotation90(ImageEntree)
ImageSortie = ImageEntree;
dim = size(ImageSortie);
xmax = dim(2);
ymax = dim(1);

for j = 1:ymax
    for i = 1:xmax
        ImageSortie(j,i) = ImageEntree(i, ymax+1-j);
    end
end

