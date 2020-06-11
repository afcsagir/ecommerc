
--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`) VALUES
(1, 'Women'),
(2, 'Men'),
(3, 'Junior');

-- --------------------------------------------------------

--
-- Table structure for table `category_relations`
--

CREATE TABLE `category_relations` (
  `cat_id` int(11) NOT NULL,
  `parent_cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_relations`
--

INSERT INTO `category_relations` (`cat_id`, `parent_cat_id`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_number` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_number`) VALUES
(1, '1'),
(2, '2');

-- --------------------------------------------------------

--
-- Table structure for table `item_category_relations`
--

CREATE TABLE `item_category_relations` (
  `item_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_category_relations`
--

INSERT INTO `item_category_relations` (`item_id`, `category_id`) VALUES
(1, 1),
(NULL, NULL),
(2, 1),
(NULL, NULL),
(2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `category_relations`
--
ALTER TABLE `category_relations`
  ADD PRIMARY KEY (`cat_id`,`parent_cat_id`),
  ADD KEY `parent_cat_id` (`parent_cat_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `item_category_relations`
--
ALTER TABLE `item_category_relations`
  ADD KEY `item_id` (`item_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_relations`
--
ALTER TABLE `category_relations`
  ADD CONSTRAINT `category_relations_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `category_relations_ibfk_2` FOREIGN KEY (`parent_cat_id`) REFERENCES `categories` (`cat_id`);

--
-- Constraints for table `item_category_relations`
--
ALTER TABLE `item_category_relations`
  ADD CONSTRAINT `item_category_relations_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `item_category_relations_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`cat_id`);
COMMIT;
