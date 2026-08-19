# Git = Distributed Version Control System (DVCS)

## Centralized (SVN)

```
          [Server]
             |
    +--------+--------+
    |        |        |
  [Dev 1]  [Dev 2]  [Dev 3]
```


## Distributed (Git)

```
          [Server]
         /        \
    [Dev 1]      [Dev 2]
       |            |
    [Local]      [Local]
```


| Theory | Centralized (SVN) | Distributed (Git) |
|:-------|:------------------|:------------------|
| **Repo Location** | One central server | Full copy on every dev machine |
| **Network** | Required for commits | Only for push/pull |
| **History** | Single source of truth | Every clone has full history |
| **Offline Work** | Limited | Full functionality |
| **Architecture** | `Server → Devs` | `Server ↔ Devs ↔ Local` |