%base img folder
a ='/scratch/lschmutz/mmsr-master/datasets/val480LR';
cd /scratch/lschmutz/mmsr-master/datasets/val480LR
A =dir('*.png');

%naming and resizing loop
for i = 1 : length(A)
    im_i = A(i).name;
    %read image
    cd /scratch/lschmutz/mmsr-master/datasets/val480LR
    I = imread(im_i);
    %write img x4
    cd /scratch/lschmutz/mmsr-master/datasets/val480bicubic
    I = imresize(I, 4);
    %name = [sprintf('%d.png', i)];
    imwrite(I, im_i);
end