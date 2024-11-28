-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: muster
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `sales_2021`
--

DROP TABLE IF EXISTS `sales_2021`;
/*!50001 DROP VIEW IF EXISTS `sales_2021`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_2021` AS SELECT 
 1 AS `perfume_id`,
 1 AS `month`,
 1 AS `customers`,
 1 AS `product_sold`,
 1 AS `difference`,
 1 AS `not_sold`,
 1 AS `restock`,
 1 AS `largest_orders_in_the_year`,
 1 AS `stock_2021`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `income_2020`
--

DROP TABLE IF EXISTS `income_2020`;
/*!50001 DROP VIEW IF EXISTS `income_2020`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `income_2020` AS SELECT 
 1 AS `id`,
 1 AS `month`,
 1 AS `revenue`,
 1 AS `expected_revenue`,
 1 AS `gross_profit`,
 1 AS `expected_gross_profit`,
 1 AS `net_profit`,
 1 AS `expected_net_profit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `income_2021`
--

DROP TABLE IF EXISTS `income_2021`;
/*!50001 DROP VIEW IF EXISTS `income_2021`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `income_2021` AS SELECT 
 1 AS `id`,
 1 AS `month`,
 1 AS `revenue`,
 1 AS `expected_revenue`,
 1 AS `gross_profit`,
 1 AS `expected_gross_profit`,
 1 AS `net_profit`,
 1 AS `expected_net_profit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sales_2020`
--

DROP TABLE IF EXISTS `sales_2020`;
/*!50001 DROP VIEW IF EXISTS `sales_2020`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_2020` AS SELECT 
 1 AS `perfume_id`,
 1 AS `month`,
 1 AS `customers`,
 1 AS `product_sold`,
 1 AS `difference`,
 1 AS `not_sold`,
 1 AS `restock`,
 1 AS `largest_orders_in_the_year`,
 1 AS `stock_2020`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `outcome_2020`
--

DROP TABLE IF EXISTS `outcome_2020`;
/*!50001 DROP VIEW IF EXISTS `outcome_2020`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `outcome_2020` AS SELECT 
 1 AS `perfume_id`,
 1 AS `month`,
 1 AS `restock`,
 1 AS `outcome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `outcome_2021`
--

DROP TABLE IF EXISTS `outcome_2021`;
/*!50001 DROP VIEW IF EXISTS `outcome_2021`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `outcome_2021` AS SELECT 
 1 AS `perfume_id`,
 1 AS `month`,
 1 AS `restock`,
 1 AS `outcome`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `sales_2021`
--

/*!50001 DROP VIEW IF EXISTS `sales_2021`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_2021` AS select `o`.`perfume_id` AS `perfume_id`,month(`o`.`order_date`) AS `month`,count(0) AS `customers`,sum(`o`.`quantity`) AS `product_sold`,(sum(`o`.`quantity`) - lag(sum(`o`.`quantity`)) OVER (PARTITION BY `o`.`perfume_id` ORDER BY `o`.`perfume_id`,month(`o`.`order_date`) ) ) AS `difference`,(`ms`.`stock_2021` - sum(`o`.`quantity`)) AS `not_sold`,lag(sum(`o`.`quantity`)) OVER (PARTITION BY `o`.`perfume_id` ORDER BY `o`.`perfume_id`,month(`o`.`order_date`) )  AS `restock`,max(sum(`o`.`quantity`)) OVER (PARTITION BY `o`.`perfume_id` ORDER BY `o`.`perfume_id` )  AS `largest_orders_in_the_year`,`ms`.`stock_2021` AS `stock_2021` from (`orders` `o` join `monthly_stock` `ms` on((`ms`.`perfume_id` = `o`.`perfume_id`))) where (year(`o`.`order_date`) = 2021) group by `o`.`perfume_id`,`ms`.`stock_2021`,month(`o`.`order_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `income_2020`
--

/*!50001 DROP VIEW IF EXISTS `income_2020`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `income_2020` AS select `pe`.`id` AS `id`,month(`o`.`order_date`) AS `month`,(sum(`o`.`quantity`) * `pr`.`product_price`) AS `revenue`,(`ms`.`stock_2020` * `pr`.`product_price`) AS `expected_revenue`,((sum(`o`.`quantity`) * `pr`.`product_price`) - (sum(`o`.`quantity`) * (`pr`.`product_price` - `pr`.`cogs_2020`))) AS `gross_profit`,((`ms`.`stock_2020` * `pr`.`product_price`) - (`ms`.`stock_2020` * (`pr`.`product_price` - `pr`.`cogs_2020`))) AS `expected_gross_profit`,(sum(`o`.`quantity`) * (`pr`.`product_price` - `pr`.`cogs_2020`)) AS `net_profit`,(`ms`.`stock_2020` * (`pr`.`product_price` - `pr`.`cogs_2020`)) AS `expected_net_profit` from (((`perfumes` `pe` join `orders` `o` on((`o`.`perfume_id` = `pe`.`id`))) join `prices` `pr` on((`pr`.`perfume_id` = `pe`.`id`))) join `monthly_stock` `ms` on((`ms`.`perfume_id` = `pe`.`id`))) where (year(`o`.`order_date`) = 2020) group by `pe`.`id`,month(`o`.`order_date`),`pr`.`product_price`,`ms`.`stock_2020`,`pr`.`cogs_2020` order by `pe`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `income_2021`
--

/*!50001 DROP VIEW IF EXISTS `income_2021`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `income_2021` AS select `pe`.`id` AS `id`,month(`o`.`order_date`) AS `month`,(sum(`o`.`quantity`) * `pr`.`product_price`) AS `revenue`,(`ms`.`stock_2021` * `pr`.`product_price`) AS `expected_revenue`,((sum(`o`.`quantity`) * `pr`.`product_price`) - (sum(`o`.`quantity`) * (`pr`.`product_price` - `pr`.`cogs_2021`))) AS `gross_profit`,((`ms`.`stock_2021` * `pr`.`product_price`) - (`ms`.`stock_2021` * (`pr`.`product_price` - `pr`.`cogs_2021`))) AS `expected_gross_profit`,(sum(`o`.`quantity`) * (`pr`.`product_price` - `pr`.`cogs_2021`)) AS `net_profit`,(`ms`.`stock_2021` * (`pr`.`product_price` - `pr`.`cogs_2021`)) AS `expected_net_profit` from (((`perfumes` `pe` join `orders` `o` on((`o`.`perfume_id` = `pe`.`id`))) join `prices` `pr` on((`pr`.`perfume_id` = `pe`.`id`))) join `monthly_stock` `ms` on((`ms`.`perfume_id` = `pe`.`id`))) where (year(`o`.`order_date`) = 2021) group by `pe`.`id`,month(`o`.`order_date`),`pr`.`product_price`,`ms`.`stock_2021`,`pr`.`cogs_2021` order by `pe`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_2020`
--

/*!50001 DROP VIEW IF EXISTS `sales_2020`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_2020` AS select `o`.`perfume_id` AS `perfume_id`,month(`o`.`order_date`) AS `month`,count(0) AS `customers`,sum(`o`.`quantity`) AS `product_sold`,(sum(`o`.`quantity`) - lag(sum(`o`.`quantity`)) OVER (PARTITION BY `o`.`perfume_id` ORDER BY `o`.`perfume_id`,month(`o`.`order_date`) ) ) AS `difference`,(`ms`.`stock_2020` - sum(`o`.`quantity`)) AS `not_sold`,lag(sum(`o`.`quantity`)) OVER (PARTITION BY `o`.`perfume_id` ORDER BY `o`.`perfume_id`,month(`o`.`order_date`) )  AS `restock`,max(sum(`o`.`quantity`)) OVER (PARTITION BY `o`.`perfume_id` ORDER BY `o`.`perfume_id` )  AS `largest_orders_in_the_year`,`ms`.`stock_2020` AS `stock_2020` from (`orders` `o` join `monthly_stock` `ms` on((`ms`.`perfume_id` = `o`.`perfume_id`))) where (year(`o`.`order_date`) = 2020) group by `o`.`perfume_id`,`ms`.`stock_2020`,month(`o`.`order_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `outcome_2020`
--

/*!50001 DROP VIEW IF EXISTS `outcome_2020`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `outcome_2020` AS select `sl`.`perfume_id` AS `perfume_id`,`sl`.`month` AS `month`,ifnull(`sl`.`restock`,(select `ms`.`stock_2020` from `monthly_stock` limit 1)) AS `restock`,(ifnull(`sl`.`restock`,(select `ms`.`stock_2020` from `monthly_stock` limit 1)) * `pr`.`cogs_2020`) AS `outcome` from ((`sales_2020` `sl` join `prices` `pr` on((`pr`.`perfume_id` = `sl`.`perfume_id`))) join `monthly_stock` `ms` on((`ms`.`perfume_id` = `sl`.`perfume_id`))) order by `sl`.`perfume_id`,`sl`.`month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `outcome_2021`
--

/*!50001 DROP VIEW IF EXISTS `outcome_2021`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `outcome_2021` AS select `sl`.`perfume_id` AS `perfume_id`,`sl`.`month` AS `month`,ifnull(`sl`.`restock`,(select `ms`.`stock_2021` from `monthly_stock` limit 1)) AS `restock`,(ifnull(`sl`.`restock`,(select `ms`.`stock_2021` from `monthly_stock` limit 1)) * `pr`.`cogs_2021`) AS `outcome` from ((`sales_2021` `sl` join `prices` `pr` on((`pr`.`perfume_id` = `sl`.`perfume_id`))) join `monthly_stock` `ms` on((`ms`.`perfume_id` = `sl`.`perfume_id`))) order by `sl`.`perfume_id`,`sl`.`month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28 18:50:27
