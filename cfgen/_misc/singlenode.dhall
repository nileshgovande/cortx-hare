let CD = ./ClusterDesc/package.dhall
in
{ hosts =
    [ { name = "localhost"
      , disks = { path_glob = "/dev/loop[0-9]*" }
      , m0_servers =
          [ { runs_confd = Some True
            , io_disks = { path_regex = "." }
            }
          ]
      , c0_clients = 2
      , m0t1fs_clients = 0
      }
    ]
, pools =
    [ { name = "the pool"
      , disks = CD.PoolDisks.all
      , data_units = 1
      , parity_units = 0
      , allowed_failures = None CD.FailVec
      }
    ]
} : CD.ClusterDesc
