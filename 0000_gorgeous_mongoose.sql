CREATE TABLE `company` (
	`uid` integer,
	`gecko_id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`internal__last_updated` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `company_to_product` (
	`company_gecko_id` text NOT NULL,
	`product_gecko_id` text NOT NULL,
	PRIMARY KEY(`company_gecko_id`, `product_gecko_id`),
	FOREIGN KEY (`company_gecko_id`) REFERENCES `company`(`gecko_id`) ON UPDATE cascade ON DELETE cascade,
	FOREIGN KEY (`product_gecko_id`) REFERENCES `product`(`gecko_id`) ON UPDATE cascade ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `config` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`created_at` integer NOT NULL,
	`website_url` text NOT NULL,
	`website_user` text NOT NULL,
	`website_password` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `event_category` (
	`uid` integer NOT NULL,
	`name` text NOT NULL,
	`gecko_id` integer PRIMARY KEY NOT NULL,
	`internal__last_updated` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `event` (
	`uid` integer,
	`name` text NOT NULL,
	`gecko_id` text PRIMARY KEY NOT NULL,
	`description` text NOT NULL,
	`endtime` integer NOT NULL,
	`event_date` integer NOT NULL,
	`free` integer NOT NULL,
	`hidden` integer NOT NULL,
	`max_subscribers` integer NOT NULL,
	`min_subscribers` integer NOT NULL,
	`place` text NOT NULL,
	`start_time` integer NOT NULL,
	`event_category` integer NOT NULL,
	`event_product` integer NOT NULL,
	`internal__last_updated` integer NOT NULL,
	FOREIGN KEY (`event_category`) REFERENCES `event_category`(`uid`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`event_product`) REFERENCES `product`(`uid`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `newsletter` (
	`uid` integer,
	`name` text NOT NULL,
	`gecko_id` text PRIMARY KEY NOT NULL,
	`internal__last_updated` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `product` (
	`uid` integer NOT NULL,
	`name` text NOT NULL,
	`gecko_id` text PRIMARY KEY NOT NULL,
	`internal__last_updated` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `user_to_company` (
	`user_gecko_id` text NOT NULL,
	`company_gecko_id` text NOT NULL,
	PRIMARY KEY(`company_gecko_id`, `user_gecko_id`),
	FOREIGN KEY (`user_gecko_id`) REFERENCES `user`(`user_id`) ON UPDATE cascade ON DELETE cascade,
	FOREIGN KEY (`company_gecko_id`) REFERENCES `company`(`gecko_id`) ON UPDATE cascade ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `user_to_event` (
	`user_gecko_id` text NOT NULL,
	`event_gecko_id` text NOT NULL,
	PRIMARY KEY(`event_gecko_id`, `user_gecko_id`),
	FOREIGN KEY (`user_gecko_id`) REFERENCES `user`(`user_id`) ON UPDATE cascade ON DELETE cascade,
	FOREIGN KEY (`event_gecko_id`) REFERENCES `event`(`gecko_id`) ON UPDATE cascade ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `user_to_newsletter` (
	`user_gecko_id` text NOT NULL,
	`newsletter_gecko_id` text NOT NULL,
	PRIMARY KEY(`newsletter_gecko_id`, `user_gecko_id`),
	FOREIGN KEY (`user_gecko_id`) REFERENCES `user`(`user_id`) ON UPDATE cascade ON DELETE cascade,
	FOREIGN KEY (`newsletter_gecko_id`) REFERENCES `newsletter`(`gecko_id`) ON UPDATE cascade ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `user` (
	`uid` integer,
	`disabled` integer NOT NULL,
	`email` text NOT NULL,
	`end_time` integer,
	`firm_id` integer,
	`first_name` text NOT NULL,
	`last_name` text NOT NULL,
	`login_type` text NOT NULL,
	`start_time` integer,
	`tstamp` integer,
	`user_id` text PRIMARY KEY NOT NULL,
	`username` text NOT NULL,
	`internal__last_updated` integer NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `event_category_uid_unique` ON `event_category` (`uid`);--> statement-breakpoint
CREATE UNIQUE INDEX `product_uid_unique` ON `product` (`uid`);