﻿using System;
using System.Threading.Tasks;
using Delivered;

namespace DemoDistributor.Endpoints.FileSystem
{
    public class FileSystemDeliveryService : ConcurrencyLimitedEndpointDeliveryService<DistributableFile, FileSystemEndpoint>
    {
        public FileSystemDeliveryService()
        {
            MaximumConcurrentDeliveries(5);
        }

        protected override async Task DoDeliveryAsync(DistributableFile file, FileSystemEndpoint endpoint)
        {
            Console.WriteLine($"Distributing file {file.Name} to File System directory {endpoint.Directory}");

            await Task.Delay(2000);

            Console.WriteLine($"Distributed file {file.Name} to File System directory {endpoint.Directory}");

            await Task.FromResult(0);
        }
    }
}
