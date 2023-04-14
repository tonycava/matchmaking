export type Chat = {
	id: string;
	userId: string;
	content: string;
	createdAt: Date;
	user: { username: string };
};

export enum WEB_SOCKET_EVENT {
	CONNECT = 'connect',
	LEAVE_WAITING = 'leaveWaiting',
	JOIN_GAME = 'joinGame',
	JOIN_WAITING = 'joinWaiting',
	UPDATE = 'update',
	PLAY = 'play',
	CHAT = 'chat',
	NEW_MESSAGE = 'newMessage',
	PARTNER = 'partner'
}

export type Range = {
	start: number;
	end: number;
};

export type Game = {
	state: 'choosing' | 'reveal' | 'finished';
	round: number;
	timerPlay: number;
	timerRev: number;
	players: [string, string];
	whoWin: [Some, Some, Some];
	actualPlay: {
		[player: string]: string | Move
	};
};

export type Some = string | null;
export type Move = 'rock' | 'paper' | 'scissors';