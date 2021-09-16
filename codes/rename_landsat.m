a ='/scratch/lschmutz/mmsr-master/datasets/Landsat';
A =dir( fullfile(a, '*.png') );
fileNames = { A.name };
for iFile = 1 : numel( A )
  newName = fullfile(a, sprintf( 'im%d.png', iFile ) );
  movefile( fullfile(a, fileNames{ iFile }), newName );    
end