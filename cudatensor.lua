require('torch')
require('cutorch')

a = torch.randn(10, 1, 224, 224)
--print(a)
a = a:cuda()

print(a[{{},1,1,1}])
