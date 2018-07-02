return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "2017.12.21",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 18,
  height = 11,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 3,
  properties = {},
  tilesets = {
    {
      name = "tileset-pokemon_dawn",
      firstgid = 1,
      filename = "../tilesets/tileset-pokemon_dawn.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      image = "../tilesets/img/tileset-pokemon_dawn.png",
      imagewidth = 1504,
      imageheight = 2519,
      transparentcolor = "#000000",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 14758,
      tiles = {}
    },
    {
      name = "OL_Alternative_DP~Chimchar~TL",
      firstgid = 14759,
      filename = "../tilesets/OL_Alternative_DP~Chimchar~TL.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      image = "../tilesets/img/OL_Alternative_DP~Chimchar~TL.png",
      imagewidth = 2528,
      imageheight = 1600,
      transparentcolor = "#000000",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 15800,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "suelito",
      x = 0,
      y = 0,
      width = 18,
      height = 11,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3158, 0, 0, 0, 0, 0, 0, 14951,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14951,
        14951, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 14951,
        14951, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 14951,
        14951, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 14951,
        14951, 23816, 23816, 23816, 23816, 23816, 23816, 24926, 23817, 23818, 23819, 23816, 23816, 23816, 23816, 23816, 23816, 14951,
        14951, 23816, 23816, 23816, 23816, 23816, 23816, 24926, 23975, 23976, 23977, 23816, 23816, 23816, 23816, 23816, 23816, 14951,
        14951, 23816, 23816, 23816, 23816, 23816, 23816, 24926, 24133, 24134, 24135, 23816, 23816, 23816, 23816, 23816, 23816, 14951,
        14951, 23816, 23816, 23816, 23816, 23816, 23816, 24926, 24291, 24292, 24293, 23816, 23816, 23816, 23816, 23816, 23816, 14951,
        14951, 23816, 23816, 23816, 23816, 23816, 23816, 24926, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 23816, 14951,
        14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951
      }
    },
    {
      type = "tilelayer",
      name = "colision 1",
      x = 0,
      y = 0,
      width = 18,
      height = 11,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "lua",
      data = {
        14951, 24450, 24451, 24451, 24451, 24451, 24451, 24451, 24451, 24451, 24451, 24451, 24451, 24451, 24451, 24451, 24452, 0,
        14951, 24608, 24609, 24609, 24609, 24609, 22706, 24609, 24609, 24609, 24609, 24609, 24609, 24609, 24609, 24609, 24610, 0,
        14951, 24766, 0, 0, 0, 23968, 22864, 0, 0, 0, 0, 0, 0, 0, 23172, 0, 24768, 0,
        14951, 0, 0, 0, 0, 0, 23022, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        14951, 0, 0, 0, 0, 0, 0, 7179, 0, 0, 0, 7179, 0, 0, 0, 0, 0, 0,
        14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 0
      }
    },
    {
      type = "tilelayer",
      name = "Capa de patrones 6",
      x = 0,
      y = 0,
      width = 18,
      height = 11,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 22559, 22560, 22561, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 22717, 22718, 22719, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 22875, 22876, 22877, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "collidable mesa",
      x = 0,
      y = 0,
      width = 18,
      height = 11,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "lua",
      data = {
        14951, 0, 0, 4404, 4405, 0, 6981, 6982, 6983, 6984, 6985, 6986, 0, 0, 0, 0, 0, 14951,
        14951, 0, 7084, 0, 0, 0, 7075, 7076, 7077, 7078, 7079, 7080, 0, 0, 7083, 0, 0, 14951,
        14951, 0, 7178, 0, 0, 23027, 0, 0, 7171, 7172, 0, 0, 23028, 0, 7177, 0, 0, 14951,
        14951, 0, 0, 0, 0, 23185, 22709, 22709, 22711, 22709, 22709, 22709, 23186, 0, 0, 0, 0, 14951,
        14951, 0, 0, 0, 0, 23343, 22867, 22867, 22869, 22867, 22867, 22867, 23344, 0, 0, 0, 0, 14951,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14951,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14951,
        14951, 0, 6795, 6796, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14951,
        14951, 0, 6889, 6890, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14951,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14951,
        14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951
      }
    },
    {
      type = "tilelayer",
      name = "sin colision",
      x = 0,
      y = 0,
      width = 18,
      height = 11,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14951,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14951,
        14951, 0, 0, 0, 0, 23173, 0, 0, 0, 0, 23811, 23173, 0, 0, 0, 0, 0, 14951,
        14951, 0, 0, 0, 0, 23173, 0, 0, 0, 23173, 23173, 23173, 22918, 18194, 18195, 18196, 0, 14951,
        14951, 0, 0, 0, 0, 23173, 23811, 23173, 23173, 23173, 23173, 23173, 0, 18352, 18353, 18354, 0, 14951,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18510, 18511, 18512, 0, 14951,
        14951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14951,
        14951, 5354, 0, 0, 5356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14951,
        14951, 5448, 0, 0, 5450, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14951,
        14951, 0, 0, 0, 0, 23679, 23679, 23679, 23500, 23501, 23502, 0, 0, 0, 0, 0, 0, 14951,
        14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951, 14951
      }
    },
    {
      type = "objectgroup",
      name = "player",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      name = "warps",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 2,
          name = "prueba",
          type = "",
          shape = "rectangle",
          x = 138.167,
          y = 141.333,
          width = 29,
          height = 18.5,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      name = "Capa de patrones 6",
      x = 0,
      y = 0,
      width = 18,
      height = 11,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 7085, 0, 0, 0, 7085, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
