$(document).on('turbolinks:load', function () {
    const url = new URL(window.location.href);
    const pathSegments = url.pathname.split('/');
    const id = pathSegments[pathSegments.length - 1];
    const currentUserId = $('div').data('currentUserId');

    App.cable.subscriptions.create({channel: 'ChatsChannel', chat_id: id}, {
        connected() {
            this.perform("follow");
        },
        received(data) {
            if (data?.message?.user_id !== currentUserId) {
                if (data.action === "post") {
                    const messageElement = `
                <div style="border: 1px solid black" data-message-id="${data.message.id}">
                    <p>User: ${data.nickname}</p>
                    <p>${data.message.body}</p>
                </div>
            `;
                    $('.messages').append(messageElement);
                }
            }
            if (data.action === "destroy") {
                $(`[data-message-id="${data.message_id}"]`).remove();
            }
        }
    });
});