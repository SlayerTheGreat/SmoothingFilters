function Filter = filtermaker( box )
    [w,h] = size(box);
    mid = ceil(w/2);
    cv = box(mid,mid);
    Filter = (255-abs(box-cv))/255;
end

