//
//  NotificationTableViewCellDelegate.swift
//  Mastodon
//
//  Created by MainasuK on 2022-1-26.
//

import UIKit
import MastodonUI
import MetaTextKit

// sourcery: protocolName = "NotificationViewDelegate"
// sourcery: replaceOf = "notificationView(notificationView"
// sourcery: replaceWith = "delegate?.tableViewCell(self, notificationView: notificationView"
protocol NotificationViewContainerTableViewCell: UITableViewCell, AutoGenerateProtocolRelayDelegate {
    var delegate: NotificationTableViewCellDelegate? { get }
    var notificationView: NotificationView { get }
}

// MARK: - AutoGenerateProtocolDelegate
// sourcery: protocolName = "NotificationViewDelegate"
// sourcery: replaceOf = "notificationView(_"
// sourcery: replaceWith = "func tableViewCell(_ cell: UITableViewCell,"
protocol NotificationTableViewCellDelegate: AnyObject, AutoGenerateProtocolDelegate {
    // sourcery:inline:NotificationTableViewCellDelegate.AutoGenerateProtocolDelegate
    func tableViewCell(_ cell: UITableViewCell, notificationView: NotificationView, authorAvatarButtonDidPressed button: AvatarButton)
    func tableViewCell(_ cell: UITableViewCell, notificationView: NotificationView, menuButton button: UIButton, didSelectAction action: MastodonMenu.Action)
    func tableViewCell(_ cell: UITableViewCell, notificationView: NotificationView, statusView: StatusView, metaText: MetaText, didSelectMeta meta: Meta)
    func tableViewCell(_ cell: UITableViewCell, notificationView: NotificationView, statusView: StatusView, actionToolbarContainer: ActionToolbarContainer, buttonDidPressed button: UIButton, action: ActionToolbarContainer.Action)
    func tableViewCell(_ cell: UITableViewCell, notificationView: NotificationView, quoteStatusView: StatusView, authorAvatarButtonDidPressed button: AvatarButton)
    func tableViewCell(_ cell: UITableViewCell, notificationView: NotificationView, quoteStatusView: StatusView, metaText: MetaText, didSelectMeta meta: Meta)
    // sourcery:end
}

// MARK: - AutoGenerateProtocolDelegate
// Protocol Extension
extension NotificationViewDelegate where Self: NotificationViewContainerTableViewCell {
    // sourcery:inline:NotificationViewContainerTableViewCell.AutoGenerateProtocolRelayDelegate
    func notificationView(_ notificationView: NotificationView, authorAvatarButtonDidPressed button: AvatarButton) {
        delegate?.tableViewCell(self, notificationView: notificationView, authorAvatarButtonDidPressed: button)
    }

    func notificationView(_ notificationView: NotificationView, menuButton button: UIButton, didSelectAction action: MastodonMenu.Action) {
        delegate?.tableViewCell(self, notificationView: notificationView, menuButton: button, didSelectAction: action)
    }

    func notificationView(_ notificationView: NotificationView, statusView: StatusView, metaText: MetaText, didSelectMeta meta: Meta) {
        delegate?.tableViewCell(self, notificationView: notificationView, statusView: statusView, metaText: metaText, didSelectMeta: meta)
    }

    func notificationView(_ notificationView: NotificationView, statusView: StatusView, actionToolbarContainer: ActionToolbarContainer, buttonDidPressed button: UIButton, action: ActionToolbarContainer.Action) {
        delegate?.tableViewCell(self, notificationView: notificationView, statusView: statusView, actionToolbarContainer: actionToolbarContainer, buttonDidPressed: button, action: action)
    }

    func notificationView(_ notificationView: NotificationView, quoteStatusView: StatusView, authorAvatarButtonDidPressed button: AvatarButton) {
        delegate?.tableViewCell(self, notificationView: notificationView, quoteStatusView: quoteStatusView, authorAvatarButtonDidPressed: button)
    }

    func notificationView(_ notificationView: NotificationView, quoteStatusView: StatusView, metaText: MetaText, didSelectMeta meta: Meta) {
        delegate?.tableViewCell(self, notificationView: notificationView, quoteStatusView: quoteStatusView, metaText: metaText, didSelectMeta: meta)
    }
    // sourcery:end
}
