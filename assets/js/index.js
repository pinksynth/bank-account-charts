/* global
	Plaid
	__plaidEnv
	__plaidProducts
	__plaidPublicKey
*/
document.addEventListener('DOMContentLoaded', () => {
	const inputUserName = document.querySelector('#username');
	const buttonOpenLinkDialog = document.querySelector('#open-link-dialog');
	let username;

	inputUserName.addEventListener('keyup', (e) => {
		username = e.target.value;
		console.log('username', username);
		if (username === '' || username === null) {
			return buttonOpenLinkDialog.classList.add('disabled');
		}
		buttonOpenLinkDialog.classList.remove('disabled');
	});

	buttonOpenLinkDialog.addEventListener('click', (e) => {
		if (e.target.closest('.disabled')) return false;
		let handler = getPlaidHandler();
		handler.open();
	});

	function getPlaidHandler() {
		return Plaid.create({
			apiVersion: 'v2',
			clientName: 'Bank Account Charts',
			env: __plaidEnv,
			product: __plaidProducts,
			key: __plaidPublicKey,
			onSuccess: function (public_token) {
				console.log('public_token', public_token);
				fetch(`/api/exchange_token`, {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json'
					},
					body: JSON.stringify({
						public_token,
						username
					}),
				}).then(() => {
					window.location.href = `/${username}/over_time`;
				});
			},
		});
	}
});
