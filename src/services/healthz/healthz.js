
exports.healthz = () => {
	try {
    return {
			status: 200,
			success: true,
			message: 'Application is running',
		};
	} catch (error) {
		return { status: 500, success: false, message: error.message };
	}
}
