global OriginalImage
global OutputImage
global Filtersize;
Images = ["Im441.tif" "Im442.jpg" "Im443.jpg" "Im444.jpg"];
mkdir('Results');
for i=[3 5 9 11 17 21 33 55]
    Filtersize = i;
    for imname = Images
        OriginalImage = imread(char(imname));
        if(size(OriginalImage,3)==3)
            OriginalImage = rgb2gray(OriginalImage);
        end
        close all
        E1
        E2
        E3
        figure('NumberTitle', 'off','Name',char("Output (Box Filter,Weighted Average, Weighted Average 2) ["+Filtersize+"]"));
        imshow(OutputImage);
        imwrite(OutputImage,char("Results\" + imname +" (Box Filter,Weighted Average, Weighted Average 2) ["+Filtersize+"].jpg"))
    end
%     waitforbuttonpress
end