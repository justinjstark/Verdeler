﻿using System;
using Distributor;

namespace Demo.Endpoints.FileSystem
{
    public class FileSystemEndpoint : IEndpoint
    {
        public Guid Id { get; set; }
        public string Directory { get; set; }
    }
}