

module "monitor_apache" {
  source = "./modules/dynatrace_monitored_technologies_apache"
  config = var.technologies["apache"]
}


module "monitor_dotnet" {
  source = "./modules/dynatrace_monitored_technologies_dotnet"
  config = var.technologies["dotnet"]
}


module "monitor_go" {
  source = "./modules/dynatrace_monitored_technologies_go"
  config = var.technologies["go"]
}


module "monitor_iis" {
  source = "./modules/dynatrace_monitored_technologies_iis"
  config = var.technologies["iis"]
}


module "monitor_java" {
  source = "./modules/dynatrace_monitored_technologies_java"
  config = var.technologies["java"]
}


module "monitor_nginx" {
  source = "./modules/dynatrace_monitored_technologies_nginx"
  config = var.technologies["nginx"]
}


module "monitor_nodejs" {
  source = "./modules/dynatrace_monitored_technologies_nodejs"
  config = var.technologies["nodejs"]
}


module "monitor_opentracing" {
  source = "./modules/dynatrace_monitored_technologies_opentracing"
  config = var.technologies["opentracing"]
}


module "monitor_php" {
  source = "./modules/dynatrace_monitored_technologies_php"
  config = var.technologies["php"]
}


module "monitor_python" {
  source = "./modules/dynatrace_monitored_technologies_python"
  config = var.technologies["python"]
}


module "monitor_wsmb" {
  source = "./modules/dynatrace_monitored_technologies_wsmb"
  config = var.technologies["wsmb"]
}


module "monitor_varnish" {
  source = "./modules/dynatrace_monitored_techologies_varnish"
  config = var.technologies["varnish"]
}
