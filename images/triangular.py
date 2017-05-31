from mpl_toolkits import mplot3d
import numpy as np
import matplotlib.pyplot as plt

# color maps: https://matplotlib.org/examples/color/colormaps_reference.html

plt.style.use('fivethirtyeight')

x = np.linspace(0, 1, 30 + 1)
y = np.linspace(0, 1, 30 + 1)

X, Y = np.meshgrid(x, y)
XY = X * Y

norms = dict()
norms['conjunction_godel']      = np.minimum(X, Y)
norms['disjunction_godel']      = np.maximum(X, Y)
norms['implication_godel']      = np.maximum(1 - X, Y)
norms['equivalence_godel']      = np.minimum(np.maximum(1 - X, Y), np.maximum(1 - Y, X))
norms['ex_disjunction_godel']   = np.maximum(np.minimum(1 - X, Y), np.minimum(1 - Y, X))

norms['conjunction_luka']       = np.maximum(0, X + Y - 1)
norms['disjunction_luka']       = np.minimum(1, X + Y)
norms['implication_luka']       = np.minimum(1, 1 - X + Y)
norms['equivalence_luka']       = 1 - np.absolute(X - Y)
norms['ex_disjunction_luka']    = np.absolute(X - Y)

norms['conjunction_prod']       = X * Y
norms['disjunction_prod']       = X + Y - XY
norms['implication_prod']       = 1 - X + XY
norms['equivalence_prod']       = (1 - X + XY) * (1 - Y + XY)
norms['ex_disjunction_prod']    = 1 - (1 - X + XY) * (1 - Y + XY)

for key, val in norms.items():
  fig = plt.figure()
  ax = plt.axes(projection='3d')
  ax.plot_surface(X, Y, val, rstride=1, cstride=1, cmap='Blues', edgecolor='k')
  ax.set_xlabel('x')
  ax.set_ylabel('y')
  ax.set_zlabel('Truth value')
  ax.view_init(50, 260)
  filename = 'tnorms/' + key + '.png'
  plt.savefig(filename)
