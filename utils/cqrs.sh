#!/usr/local/bin/bash
# This script accelerates the creation of CQRS queries and commands in a .NET Core application that uses MediatR.


#
# Functions
#

# Create files for a query.
# $1 is the namespace
# $2 is the name of the query
# $3 is the path where to create the files
function create_query() {
    mkdir -p $3

    queryFilePath=$3$2"Query.cs"
    queryHandlerFilePath=$3$2"QueryHandler.cs"
    queryResponseFilePath=$3$2"QueryResponse.cs"

    cat >$queryFilePath <<EOL
using MediatR;

namespace ${1}.Workflows.${2}.Queries
{
    public class ${2}Query : IRequest<${2}QueryResponse>
    {
        public int Id { get; set; }
    }
}
EOL
    printf "\nCreated $queryFilePath"


    cat >$queryHandlerFilePath <<EOL
using System;
using System.Threading.Tasks;
using MediatR;

namespace ${1}.Workflows.${2}.Queries
{
    public class ${2}QueryHandler : IAsyncRequestHandler<${2}Query, ${2}QueryResponse>
    {
        public async Task<${2}QueryResponse> Handle(${2}Query query)
        {
            return new ${2}QueryResponse();
        }
    }
}
EOL
    printf "\nCreated $queryHandlerFilePath"


    cat >$queryResponseFilePath <<EOL
namespace ${1}.Workflows.${2}.Queries
{
    public class ${2}QueryResponse
    {
    }
}
EOL
    printf "\nCreated $queryResponseFilePath"
}

# Create files for a command.
# $1 is the namespace
# $2 is the name of the command
# $3 is the path where to create the files
function create_command() {
    mkdir -p $3

    commandFilePath=$3$2"Command.cs"
    commandHandlerFilePath=$3$2"CommandHandler.cs"
    commandResponseFilePath=$3$2"CommandResponse.cs"

    cat >$commandFilePath <<EOL
using MediatR;

namespace ${1}.Workflows.${2}.Commands
{
    public class ${2}Command : IRequest<${2}CommandResponse>
    {
        public int Id { get; set; }
    }
}
EOL
    printf "\nCreated $commandFilePath"


    cat >$commandHandlerFilePath <<EOL
using System;
using System.Threading.Tasks;
using MediatR;

namespace ${1}.Workflows.${2}.Commands
{
    public class ${2}CommandHandler : IAsyncRequestHandler<${2}Command, ${2}CommandResponse>
    {
        public async Task<${2}CommandResponse> Handle(${2}Command command)
        {
            return new ${2}CommandResponse();
        }
    }
}
EOL
    printf "\nCreated $commandHandlerFilePath"


    cat >$commandResponseFilePath <<EOL
namespace ${1}.Workflows.${2}.Commands
{
    public class ${2}CommandResponse
    {
    }
}
EOL
    printf "\nCreated $commandResponseFilePath"
}



#
# Main script
#
namespace="$(cat Startup.cs | grep namespace | tr -d '\r' | cut -d' ' -f2)"
printf "Identified the following namespace: $namespace\n"
printf "\nChoose an option:"
printf "\n1) Create a query"
printf "\n2) Create a command"
printf "\n3) Create a CRUD set: 3 commands (Create, Update, Delete) and 1 query (Retrieve)\n"
read choice

case "$choice" in
    1) 
        # Create a query
        printf "\nHow do you want to call this new query? [YourAnswer]Query\n"
        read queryName
        printf "\nWhere should the files be created?\n"
        read -i "./Workflows/"$queryName"s/Queries/" -e path
        create_query $namespace $queryName $path
        ;;
    2)
        # Create a command
        printf "\nHow do you want to call this new command? [YourAnswer]Command\n"
        read commandName
        printf "\nWhere should the files be created?\n"
        read -i "./Workflows/"$commandName"s/Commands/" -e path
        create_command $namespace $commandName $path
        ;;
    3)
        # Create a CRUD set
        printf "\nHow do you want to call this new CRUD set? [Action][YourAnswer]Command, [YourAnswer]Query\n"
        read commandName
        printf "\nWhere should the files be created?\n"
        read -i "./Workflows/"$commandName"s/" -e path
        create_query $namespace $commandName $path"Queries/"
        create_command $namespace "Create$commandName" $path"Commands/"
        create_command $namespace "Update$commandName" $path"Commands/"
        create_command $namespace "Delete$commandName" $path"Commands/"
        ;;
    *)
        # Unknown choice
        printf "\nUnknown choice. Exiting."
        exit 1
esac
printf "\n"