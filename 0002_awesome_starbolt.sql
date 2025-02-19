
DROP TABLE `user_to_newsletter`;--> statement-breakpoint
DROP TABLE `newsletter`;--> statement-breakpoint
--> statement-breakpoint
CREATE TABLE `newsletter` (
	`uid` integer NOT NULL,
	`name` text NOT NULL,
	`gecko_global_id` text PRIMARY KEY NOT NULL,
	`internal__last_updated` integer NOT NULL
);--> statement-breakpoint
CREATE TABLE `new_user_to_newsletter` (
	`user_gecko_id` text NOT NULL,
	`newsletter_gecko_id` text NOT NULL,
	PRIMARY KEY(`user_gecko_id`, `newsletter_gecko_id`),
	FOREIGN KEY (`user_gecko_id`) REFERENCES `user`(`user_id`) ON UPDATE cascade ON DELETE cascade,
	FOREIGN KEY (`newsletter_gecko_id`) REFERENCES `newsletter`(`gecko_global_id`) ON UPDATE cascade ON DELETE cascade
);

