// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/**
 * State transitions of an offline region.
 *
 *                  download()
 *                      │
 *                      │
 *                   ┌──▼──────┐
 *              ┌────▶ Pending ├─────────────delete()────┐
 *              │    └───────▲─┘                         │
 *              │      │  │  │                           │
 *          download() │  │  └───download()──┐           │
 *              │      │  │                  │           │
 *              │      │  │           ┌──────┴─────┐     │
 *              │      │  └─cancel()──▶ Incomplete ├──┐  │
 *              │      │              └──────▲─────┘  │  │
 *      ┌───────┴─┐  (scheduled)             │        │  │
 *      │ Errored │    │                     │        │  │
 *      └─▲──┬──▲─┘    │    ┌────cancel()────┘        │  │
 *        │  │  │      │    │                   delete() │
 *        │  │  │  ┌───▼─────────┐                    │  │
 *        │  │  └──│ Downloading │───delete()──────┐  │  │
 *        │  │     └─────────────┘                 │  │  │
 *        │  │            │                        │  │  │
 *        │  │       (completes)                 ┌ ▼ ─▼─ ▼ ┐
 *        │  └────────────│───────────delete()───▶ Deleted
 *        │               │                      └ ─▲─ ─▲─ ┘
 *        │         ┌─────▼─────┐                   │   │
 *     (failed)─────│ Verifying │─────delete()──────┘   │
 *                  └───────────┘                       │
 *                        │                         (succeeds)
 *                   (successful)                       │
 *                        │                             │
 *                  ┌─────▼─────┐                  ┌────┴─────┐
 *                  │ Available ├───────delete()───▶ Deleting │
 *                  └─────▲─────┘                  └────┬─────┘
 *                        │                             │
 *                        └─────────download()──────────┘
 */
// NOLINTNEXTLINE(modernize-use-using)
typedef NS_CLOSED_ENUM(NSInteger, MBXOfflineDataPackStatus)
{
    /**
     * This offline pack is marked for downloading, but it has not yet begun.
     * Check the `downloaded_size` field against the pack metadata's `size` to compute progress.
     * The file on disk is unusable.
     */
    MBXOfflineDataPackStatusPending,
    /**
     * The download is in progress.
     * Check the `downloaded_size` field against the pack metadata's `size` to compute progress.
     * The file on disk is unusable.
     */
    MBXOfflineDataPackStatusDownloading,
    /**
     * The download is incomplete, and not scheduled to be downloaded.
     * Check the `downloaded_size` field against the pack metadata's `size` to compute progress.
     * The file on disk is unusable.
     */
    MBXOfflineDataPackStatusIncomplete,
    /**
     * The download is complete, but not yet usable.
     * Verification of the download is in progress.
     */
    MBXOfflineDataPackStatusVerifying,
    /** The offline pack is complete and the file on disk is usable. */
    MBXOfflineDataPackStatusAvailable,
    /**
     * The offline pack is expired and can't be used until it is refreshed.
     * The file on disk must not be used.
     */
    MBXOfflineDataPackStatusExpired,
    /**
     * The download failed or is unusable.
     * Check the `error` field for a more detailed status code.
     * The file on disk is unusable.
     */
    MBXOfflineDataPackStatusErrored,
    /**
     * The download is marked for deleting.
     * Code that is currently still using the file should cease to do so as soon as possible and
     * once finished, acknowledge receipt of this status update. Offline packs in this state should
     * no longer be shown to the user, and code shouldn't start using them.
     */
    MBXOfflineDataPackStatusDeleting,
    /** The download has been deleted */
    MBXOfflineDataPackStatusDeleted
} NS_SWIFT_NAME(OfflineDataPackStatus);
