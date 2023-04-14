export type Chat = {
	id: string;
	userId: string;
	content: string;
	createdAt: Date;
	user: { username: string };
};

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
	actualPlay: Record<string, Move | string>;
};

export type Some = string | null;
export type Move = 'rock' | 'paper' | 'scissors';
