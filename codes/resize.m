%base img folder
a ='/home/lschmutz/esrgan/baseimg';
A =dir( fullfile(a, '*.tif') );
%counter 
nm_im = 1;

%naming and resizing loop
for i = 1 : numel( A )
    %print i
    i
    %read image
    cd /home/lschmutz/esrgan/baseimg
    I = imread(sprintf('im%d.tif', i));
    I = I(:,:,1:3);
    
    cd /home/lschmutz/esrgan/basepng
    imwrite(I, sprintf('im%d.png', i));
    %create subimages
    a = 1;
    b = 0;
    c = 1;
    d = 1;
    e = 0;
    out_size = 480;
    mnd = size(I);
    m = mnd(1);
    n = mnd(2);
    
    while c*out_size < m
        while a*out_size < n
            %create subimage out_size*out_size
            cd /home/lschmutz/esrgan/GT480
            sub_i = I(1+(out_size*e):c*out_size, 1+(out_size*b):a*out_size, :);
            name = [sprintf('%d.png', nm_im)];
            imwrite(sub_i, name);
            %create subimage LR *4
            cd /home/lschmutz/esrgan/LR480
            sub_i = imresize(sub_i, 0.25);
            name = [sprintf('%d.png', nm_im)];
            imwrite(sub_i, name);

            a = a+1;
            b = b+1;
            nm_im = nm_im+1
        end
        a = 1;
        b = 0;
        c = c + 1;
        e = e + 1;
    end
end