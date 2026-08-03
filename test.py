# arr = map(int, input().split())
# my_list = list(arr)
# print()

"""
# cases : 2 5 6 3 8
# """
# list_ = [2, 9, 3, 5, 8, 9]
# val = []
# for i in range(len(list_)):
#     if len(val) == 0: 
#         max_num = max(list_)
#         val.append(max_num)
#         list_.remove(max_num)
#     else:
#         max_num = max(list_)
#         if max_num in val:
#             list_.remove(max_num)
#         else:
#             print(max_num)
#             break

# import numpy as np
# import random
# np.random.seed(31)

# # Total number of rows.
# num_rows = 150

# # Generate the SKU_ID column , having some extra string_choice.
# ext_string = ['\n', '\t', '', '', '', '', '', '', '',''] # increasing the wieght of normal empty string, so minimum data got messy.
# sku_code = [f'{random.choice(ext_string)}SKU-{random.randint(1110,9989)}{random.choice(ext_string)}' for _ in range(num_rows)]

# bla = np.random.choice(ext_string[:2], size=5)
# print(bla)

# dic_ = {
#     'NVDIA RTX-3050 GPU': 1135,
#     'NVME-SSD 256GB': 345,
#     'Intel i5 12450hx chip': 234,
#     'NVDIA RTX-4050 GPU': 2352,
#     'NVME-SSD 512GB<strong>': 3334, # Adding some extra strings to mess with the data
#     '<br>DDR4-RAM 32GB</br>': 2334, # Also in here
#     'DDR5-RAM 16GB': 3444,
#     'Intel i7 13450hs chip': 3323,
# }

# product_title = []
# Raw_price = []
# for _ in range(150):
#     name = random.choice(list(dic_.keys()))
#     price = dic_[name]
#     product_title.append(name)
#     Raw_price.append(price)

# print(product_title[:10])
# print(Raw_price[:10])

_list = ['ghe', 'shdhf', 'sdf']

print(_list)
copy_list = _list[:]
print(copy_list)
_list[1] = 'hello'
print(_list)
print(copy_list)
copy_list[0] = 'hi'
print(_list)
print(copy_list) 