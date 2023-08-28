
syntax = "proto3";
package streamer;

option go_package = "github.com/rqlite/rqlite/snapshot";

message IncrementalSnapshot {
    bytes data = 1;
}

message FullSnapshot {
    message DataInfo {
        int64 size = 1;
    }
    DataInfo db = 3;
    repeated DataInfo wals = 4;
}

message StreamHeader {
    int32 version = 1;
    oneof payload {
        IncrementalSnapshot incremental_snapshot = 2;
        FullSnapshot full_snapshot = 3;
    }
}