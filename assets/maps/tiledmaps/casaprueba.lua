return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "2017.12.07",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 10,
  height = 10,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 1,
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
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "suelo",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489,
        4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489,
        4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489,
        4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489,
        4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489,
        4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489,
        4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489,
        4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489, 4489
      }
    },
    {
      type = "tilelayer",
      name = "collision1",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "lua",
      data = {
        4206, 4207, 4207, 4207, 4207, 4207, 4207, 4207, 4207, 4208,
        4300, 4301, 4301, 4301, 4301, 4301, 4301, 4301, 4301, 4302,
        4394, 4395, 4395, 4395, 4395, 4395, 4395, 4395, 4395, 4396,
        0, 0, 0, 0, 6945, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 6945, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        6945, 0, 0, 0, 0, 0, 0, 0, 0, 7046,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 6945,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 6945,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 6945
      }
    },
    {
      type = "tilelayer",
      name = "no collision",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 4681, 4682, 0, 0, 0, 4500, 4501,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 5252, 5253, 5254, 0, 0, 5354, 0, 0,
        0, 0, 5346, 5347, 5348, 0, 0, 0, 0, 0,
        0, 0, 5440, 5441, 5442, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 4686, 4687, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "collision",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        7139, 7139, 7139, 0, 0, 0, 4873, 4874, 7139, 7139,
        7233, 7233, 7233, 0, 0, 0, 4967, 4968, 7233, 7233,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 5916, 5917, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "no collision",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "Capa de patrones 6",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 5822, 5823, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
