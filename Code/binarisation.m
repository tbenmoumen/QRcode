function ImageSortie = binarisation(ImageEntree, seuil)

dim = size(ImageEntree);
ImageSortie = ImageEntree;
    for i = 1:dim(2)
        for j = 1:dim(2)
            if ImageSortie(j, i) > seuil
                ImageSortie(j, i) = 1;
            else
                ImageSortie(j,i) = 0;
            end
        end
    end