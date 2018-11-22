global OriginalImage
global Filtersize
I = OriginalImage;
if(size(I,3)==3)
    I = rgb2gray(I);
end
if(size(I,3)==3)
    I = rgb2gray(I);
end
[ow,oh] = size(I);
[w,h] = size(I);
II = I;
Filter = weights(Filtersize);
[fw,fh] = size(Filter);
stepx = ceil(fw/2);
stepy = ceil(fh/2);
nx = w/size(Filter,1);
ny = h/size(Filter,2);
if (rem(w,size(Filter,1))~=0)
    nx = w-floor(w/size(Filter,1))*size(Filter,1)-1;
    I = [I;zeros(nx,h)];
    w = size(I,1);
end
if (rem(h,size(Filter,2))~=0)
    ny = h-floor(h/size(Filter,2))*size(Filter,2)-1;
    I = [I zeros(w,ny)];
    h = size(I,2);
end
for i=stepx:1:(w-stepx)
    for j=stepy:1:(h-stepy)
        coefsum = 0.0;
        sx = i-stepx;
        sy = j-stepy;
        Filter2 = filtermaker(I(sx+1:sx+fw,sy+1:sy+fh));
        Filterc = double(Filter) .* double(Filter2);
        sum = 0.0;
        for k=1:fw
            for q=1:fh
                sum = sum+double(I(sx+k,sy+q))*Filterc(k,q);
                coefsum = coefsum+Filterc(k,q);
            end
        end
        II(i,j) = sum/coefsum;
    end
end
I = I(1:ow,1:oh);
II = II(1:ow,1:oh);
OutputImage = [OutputImage II];
II = mat2gray(II);
% figure('NumberTitle', 'off', 'Name','Original Image');
% imshow(I);
% figure('NumberTitle', 'off', 'Name','Output Image (New Method)');
% imshow(II);

    