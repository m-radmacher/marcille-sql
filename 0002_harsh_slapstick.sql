PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_user_to_newsletter` (
	`user_gecko_id` text NOT NULL,
	`newsletter_gecko_id` text NOT NULL,
	PRIMARY KEY(`user_gecko_id`, `newsletter_gecko_id`),
	FOREIGN KEY (`user_gecko_id`) REFERENCES `user`(`user_id`) ON UPDATE cascade ON DELETE cascade,
	FOREIGN KEY (`newsletter_gecko_id`) REFERENCES `newsletter`(`gecko_global_id`) ON UPDATE cascade ON DELETE cascade
);
--> statement-breakpoint
INSERT INTO `__new_user_to_newsletter`("user_gecko_id", "newsletter_gecko_id") SELECT "user_gecko_id", "newsletter_gecko_id" FROM `user_to_newsletter`;--> statement-breakpoint
DROP TABLE `user_to_newsletter`;--> statement-breakpoint
ALTER TABLE `__new_user_to_newsletter` RENAME TO `user_to_newsletter`;--> statement-breakpoint
PRAGMA foreign_keys=ON;--> statement-breakpoint
CREATE TABLE `__new_newsletter` (
	`uid` integer NOT NULL,
	`name` text NOT NULL,
	`gecko_global_id` text PRIMARY KEY NOT NULL,
	`internal__last_updated` integer NOT NULL
);
--> statement-breakpoint
INSERT INTO `__new_newsletter`("uid", "name", "gecko_global_id", "internal__last_updated") SELECT "uid", "name", "gecko_global_id", "internal__last_updated" FROM `newsletter`;--> statement-breakpoint
DROP TABLE `newsletter`;--> statement-breakpoint
ALTER TABLE `__new_newsletter` RENAME TO `newsletter`;