{ pkgs, ... }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    prisma-engines
    nodePackages.prisma
    # openssl
    # nodejs
  ];
  env = {
    PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
    PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
    PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
  };
}
